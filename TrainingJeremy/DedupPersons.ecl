Import $;
sortedPersons := SORT($.Persons,LastName,FirstName,RecID);
dedupPersons := DEDUP(sortedPersons,LEFT.LastName = RIGHT.LastName, 
	LEFT.FirstName=RIGHT.FirstName) : PERSIST('~CLASS::JBB:PERSIST::DedupPersons');

OUTPUT(dedupPersons,,'~ONLINE::JBB::OUT::DedupPersons',OVERWRITE);