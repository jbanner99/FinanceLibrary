Layout_Persons := RECORD
	INTEGER4 RecID;
	STRING15 FirstName;
	STRING25 LastName;
	STRING15 MiddleName;
	STRING2 NameSuffix;
	STRING8 FileDate;
	UNSIGNED INTEGER2 BureauCode;
	STRING1 MaritalStatus;
	STRING1 Gender;
	UNSIGNED INTEGER1 DependentCount;
	STRING8 BirthDate;
	STRING42 StreetAddress;
	STRING20 City;
	STRING2 State;
	STRING5 ZipCode;
End;

Export Persons := DATASET('~online::jbb::intro::onlinelessonpersons', Layout_Persons, THOR);