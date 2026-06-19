package hu.nullfoundry.spacefarer.handlers;

import org.springframework.stereotype.Component;

import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;

@Component
@ServiceName("SpacefarerService")
public class SpacefarerServiceHandler implements EventHandler {
     
     @Before(event = "CREATE", entity = "SpacefarerService.Spacefarer")
     public void beforeCreateSpacefarer(CdsCreateEventContext context) {
          var entries = context.getCqn().entries();

          for (var entry : entries) {

               // Validation
               String name = (String) entry.get("name");

               if (name == null || name.isBlank()) {
                    throw new IllegalArgumentException("Name is required");
               }

               // Normalize
               entry.put("name", name.trim() + " cadet");
          }
     }

     @After(event = "CREATE", entity = "SpacefarerService.Spacefarer")
     public void afterCreateSpacefarer(CdsCreateEventContext context) {
          System.out.println("After Spacefarer creation");
     }

}
