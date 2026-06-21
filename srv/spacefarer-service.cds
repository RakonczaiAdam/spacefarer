using spacefarer from '../db/schema';

service SpacefarerService {
     
     entity Spacefarer 
     //@(restrict: [
     //     { grant: '*', to: 'SpaceRegistryManager' }
     //]) 
     as projection on spacefarer.Spacefarer;
     
     @readonly entity WormholeNavigationLevel as projection on spacefarer.WormholeNavigationLevel;

}
