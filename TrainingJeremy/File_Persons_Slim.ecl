IMPORT $;
EXPORT File_Persons_Slim := MODULE

EXPORT Layout := RECORD
	RecordOF($.STD_Persons.File) AND NOT [City,State,ZipCode];
	UNSIGNED4 CSZ_ID;
END;

EXPORT File := DATASET('~ONLINE::JBB::OUT::Persons_Slim', Layout,FLAT);
END;