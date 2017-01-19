//EXPORT UID_PersonsAlt := 'todo';
IMPORT $, STD;
altPersonsLayout := RECORD
UNSIGNED4 UID;
$.File_Persons.Layout;
END;

altPersonsLayout personsAlter($.File_Persons.Layout L, INTEGER C) := TRANSFORM
SELF.UID := 0;
SELF := L;
END;
altPersonsLayout personsIterateRec(altPersonsLayout L, altPersonsLayout R) := TRANSFORM
//SELF.UID := L.UID+1;
SELF.UID := if(L.uid=0,std.system.Thorlib.node()+1,L.UID+CLUSTERSIZE); 
SELF := R;
END;
ALTPersons := PROJECT($.File_Persons.File, personsAlter(LEFT, COUNTER));


EXPORT UID_PersonsAlt := ITERATE(ALTPersons, personsIterateRec(LEFT,RIGHT),LOCAL) : PERSIST('~ONLINE::JBB::PERSIST::UID_PersonsAlt');