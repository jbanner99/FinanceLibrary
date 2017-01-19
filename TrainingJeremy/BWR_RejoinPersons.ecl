IMPORT $, STD;

RECORDOF($.Persons) personsTransform($.File_Persons_Slim.File L, $.File_LookupCSZ.File R) := TRANSFORM
	SELF.RecID := L.RecID;
	SELF.FirstName := STD.Str.ToTitleCase(L.FirstName);
	SELF.LastName := STD.Str.ToTitleCase(L.LastName);
	SELF.MiddleName := STD.Str.ToTitleCase(L.MiddleName);
	SELF.NameSuffix := STD.Str.ToTitleCase(L.NameSuffix);
	SELF.FileDate := If (L.Filedate=0,'',(STRING8)L.FileDate);
	SELF.BureauCode := L.BureauCode;
	SELF.MaritalStatus :='';
	SELF.Gender := L.Gender;
	SELF.DependentCount := L.DependentCount;
	SELF.BirthDate := If(L.BirthDate=0,'',(STRING8) L.BirthDate);
	SELF.StreetAddress := L.StreetAddress;
	SELF.City := R.City;
	SELF.State := R.State;
	SELF.ZipCode := IF (R.ZipCode=0,'',INTFORMAT( R.ZipCode,5,1));

END;

myRejoinedTable := JOIN($.File_Persons_Slim.File , $.File_LookupCSZ.File , LEFT.CSZ_ID = RIGHT.CSZ_ID,
	personsTransform(LEFT,RIGHT), LEFT OUTER,LOOKUP);
OUTPUT(myRejoinedTable,,'~ONLINE::JBB::OUT::Persons_Rejoined',OVERWRITE);