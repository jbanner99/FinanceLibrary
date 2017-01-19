Import $;
myRecord := Record
  $.File_Persons.File.BureauCode;
end;
myTable := TABLE(DISTRIBUTE($.File_Persons.File,HASH32(BureauCode)), myRecord,BureauCode,LOCAL);
mySortedTable := SORT(myTable,BureauCode);

dedupPersons := DEDUP(mySortedTable,LEFT.BureauCode = RIGHT.BureauCode) ;
COUNT(dedupPersons);