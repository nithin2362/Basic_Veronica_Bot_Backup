List welcomeMsg()
{
  String user = "User";
  String wlcum =  "Welcome ${user}, I am Welcome :)";


   String commands  = """

Command         Description


!lost itemName,itemDescription,place :                 Used when user lost 
                                                              one of his\/her 
                                                               belongings.

!found itemName,itemDescription,place :               Used to intimate the 
                          info regarding any 
                          lost object.

!cleanliness placeDescription,place,status:    Used to intimate the 
                          tidiness report of a 
                          particular block
                          \/classroom.


!admission:           Used to view admission details
                       at SVCE.
                       
                       
!item_returned:         Used when a found item is 
                        returned to its owner.


!map:                 Used to locate Sri 
                        Venkateswara College 
                        of Engineering, 
                        Sriperumbudur.

!events:              Used to know about 
                        any current events on 
                        that day.

!notes:               Used to obtain notes 
                        for a particular subject 
                        (according to the 
                          department).

!date:                Returns the date of 
                          the day.

!time:                Returns the time.

""" ;


  return [wlcum,commands];
}