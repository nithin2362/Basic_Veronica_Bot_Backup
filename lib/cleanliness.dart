import 'classes.dart';

class Place
{
  String placeDescription,location,status;

  Place(var v1,var v2,{var v3:"clean"})
  {
    placeDescription = v1;
    location = v2;
    status = v3;
  }

}


List cleanliness_coordinators = [Coordinator("Kiran","987654321","5"),Coordinator("Raman","987654321","2"),Coordinator("Sai","987654321","1"),Coordinator("Rahman","987654321","3"),Coordinator("Joseph","987654321","4")];
List complaints = [];


void addSanitationReport(cleanData)
{
  complaints.add(Place(cleanData[0],cleanData[1],v3: cleanData[2]));
}




