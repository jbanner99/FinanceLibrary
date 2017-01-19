IMPORT $;
myLayout := RECORD
UNSIGNED INTEGER4 UID;
$.File_Persons.Layout;
END;
myLayout UIDAppend($.File_Persons.Layout f, INTEGER C) := TRANSFORM
SELF.UID := C;
SELF := F;
END;

UIDPersonsRec := PROJECT($.File_Persons.File, UIDAppend(LEFT,COUNTER)) : PERSIST('~CLASS::JBB::PERSIST::UID_Persons');

EXPORT UID_Persons := UIDPersonsRec;