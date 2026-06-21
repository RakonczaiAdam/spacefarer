package hu.nullfoundry.spacefarer.handlers;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Select;
import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

@Component
@ServiceName("SpacefarerService")
public class SpacefarerServiceHandler implements EventHandler {

     private final JavaMailSender mailSender;
     private final PersistenceService db;

     public SpacefarerServiceHandler(JavaMailSender mailSender, PersistenceService db) {
          this.mailSender = mailSender;
          this.db = db;
     }    
     
     @Before(event = "CREATE", entity = "SpacefarerService.Spacefarer")
     public void beforeCreateSpacefarer(CdsCreateEventContext context) {
          var entries = context.getCqn().entries();

          for (var entry : entries) {
               System.out.println("Enhancing wormholeNavigationSkill");
               String wormholeNavigationLevelId = (String) entry.get("wormholeNavigationSkill_ID");
               var skillLevelQuery = db.run(
                    Select.from("spacefarer.WormholeNavigationLevel")
                         .columns("levelOfExpertise")
                         .where(w -> w.get("ID").eq(wormholeNavigationLevelId))
               ).first();
               Integer level = ((Number) skillLevelQuery
                    .get()
                    .get("levelOfExpertise"))
                    .intValue();

               int enhancedLevel  = level + 1;

               var enhancedLevelIdQuery = db.run(
                    Select.from("spacefarer.WormholeNavigationLevel")
                         .columns("ID")
                         .where(w -> w.get("levelOfExpertise").eq(enhancedLevel))
               ).first();

               if (enhancedLevelIdQuery == null) {
                    throw new IllegalArgumentException(
                    "Invalid wormholeNavigationLevel: " + level
                    );
               }

               entry.put("wormholeNavigationSkill_ID", enhancedLevelIdQuery.get().get("ID"));
               entry.remove("wormholeNavigationLevel");
          }
     }

     @After(event = "CREATE", entity = "SpacefarerService.Spacefarer")
     public void afterCreateSpacefarer(CdsCreateEventContext context) {
          var entries = context.getCqn().entries();

          for (var entry : entries) {

               String email = (String) entry.get("email");
               String name = (String) entry.get("name");

               SimpleMailMessage message = new SimpleMailMessage();
               message.setFrom("radamka97@gmail.com");
               message.setTo(email);
               message.setSubject("Welcome to the Intergalactic Academy");
               message.setText("""
                    Greetings %s,

                    Your Spacefarer registration has been completed.

                    Safe travels through the wormholes!

                    Intergalactic Command
                    """.formatted(name));
               try {
                    mailSender.send(message);     
                    System.out.println("Email sent to %s".formatted(email));
               } catch (Exception e) {
                    System.out.println("Email sending faliure due to license limitation");
               }
          }
     }

}
