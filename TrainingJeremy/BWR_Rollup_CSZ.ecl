IMPORT $;

myRollupRec := RECORD
UNSIGNED4 CSZ_ID := $.STD_Persons.File.RecID;
City := $.STD_Persons.File.City;
State := $.STD_Persons.File.State;
ZipCode := $.STD_Persons.File.ZipCode;
END;
myCityStateZipTable := TABLE($.STD_Persons.File, myRollupRec);
sortedPersons := SORT(myCityStateZipTable, City,State,ZipCode, CSZ_ID);
myRollupRec rollupTransform(myRollupRec L, myRollupRec R) := TRANSFORM
SELF.CSZ_ID := IF (L.CSZ_ID < R.CSZ_ID,L.CSZ_ID,R.CSZ_ID);
SELF := L;
END;
OUTPUT(sortedPersons);

myRollupTable := ROLLUP(sortedPersons, 
	LEFT.CITY = RIGHT.CITY AND 
	LEFT.STATE = RIGHT.STATE AND 
	LEFT.ZIPCODE = RIGHT.ZIPCODE, 
	rollupTransform(LEFT,RIGHT)) ;
COUNT(myRollupTable);
OUTPUT(myRollupTable, ,'~ONLINE::JBB::OUT::LookupCSZ',OVERWRITE);