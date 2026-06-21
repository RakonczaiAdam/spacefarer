namespace spacefarer;
using { cuid } from '@sap/cds/common';

entity WormholeNavigationLevel : cuid {
     name : String(255) not null;
     levelOfExpertise : Integer not null;
}

entity Planet : cuid {
     name : String(255) not null;
}

entity IntergalacticDepartment : cuid {
     name : String(255) not null;
}

entity IntergalacticRole : cuid {
     department : Association to one IntergalacticDepartment not null;
     name : String(255) not null;
}

entity IntergalacticPosition : cuid {
     role : Association to one IntergalacticRole not null;
     spacefarer : Association to one Spacefarer not null;
     startOfService : Date not null;
     endOfService : Date;
}

entity Spacefarer : cuid {
     name : String(255) not null;
     email : String(255) not null;
     wormholeNavigationSkill : Association to one WormholeNavigationLevel not null;
     originPlanet : Association to one Planet;
     spacesuitColor : String(255) default 'white';
     stardustCollection: Composition of many SpacefarerStardust on stardustCollection.spacefarer = $self;
}

entity StardustType : cuid {
     name : String(255) not null;
}

entity SpacefarerStardust : cuid {
     quantity : Integer not null;
     unit : String(255) default 'Void Micron(s)';
     stardustType : Association to one StardustType not null;
     stardustTypeName: String = stardustType.name;
     spacefarer : Association to one Spacefarer not null;
}