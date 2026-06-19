using spacefarer from '../db/schema';

service PlanetService {

     @readonly entity Planet as projection on spacefarer.Planet;

}