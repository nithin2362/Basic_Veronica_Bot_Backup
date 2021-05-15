import 'classes.dart';



List lostitems = [],founditems = [Item("watch","brown colour","3"),Item("bag","brown colour","3"),Item("wallet","black colour","2")],coordinators = [Coordinator("Hari Kheshav","987654321","3"),Coordinator("Kishore","987654321","2"),Coordinator("Buvanesh","987654321","4"),Coordinator("Nithin","987654321","5"),Coordinator("Kitty","987654321","OAT")];
void refreshLostitems()
{
  for(var i = 0;i<lostitems.length;++i)
    {
      if(lostitems[i].isReturned)
        {
          founditems.add(lostitems[i]);
          lostitems.removeAt(i);
        }
    }
}

bool checkFounditems(item)
{
  refreshLostitems();
  for(var i = 0;i<founditems.length;++i)
    {
      if(item.itemName == founditems[i].itemName && item.description == founditems[i].description && item.block == founditems[i].block)
        return true;

    }
  return false;
}
void addFounditem(item)
{
  founditems.add(Item(item.itemName,item.description,item.block));
}


bool updateFounditem(item)
{
  for(var i = 0;i<founditems.length;++i)
  {
    if(item.itemName == founditems[i].itemName && item.description == founditems[i].description && item.block == founditems[i].block)
      {
        founditems[i].isReturned = true;
        return true;
      }
    return false;

  }
}

