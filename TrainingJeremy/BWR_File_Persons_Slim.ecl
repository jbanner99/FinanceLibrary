IMPORT $;



$.File_Persons_Slim.Layout joinRec($.STD_Persons.File L, $.File_LookupCSZ.File R) := TRANSFORM
	SELF.CSZ_ID := R.CSZ_ID;
	SELF := L;
END; 

myJoinedTable := JOIN($.STD_Persons.File, $.File_LookupCSZ.File, 
	LEFT.CITY = RIGHT.CITY AND 
	LEFT.STATE= RIGHT.STATE AND 
	LEFT.ZIPCODE= RIGHT.ZIPCODE,
	joinRec(LEFT,RIGHT), 
	LEFT OUTTER, LOOKUP);
	
	
OUTPUT(myJoinedTable,, '~ONLINE::JBB::OUT::Persons_Slim', OVERWRITE);