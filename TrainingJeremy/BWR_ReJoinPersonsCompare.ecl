import $;


slimTable := DATASET('~ONLINE::JBB::OUT::Persons_Rejoined',RECORDOF($.Persons),FLAT);

appendedTable := slimTable + $.Persons;

sortedTable := SORT(appendedTable,RECORD);

dedupTable := DEDUP(sortedTable,RECORD);
OUTPUT(COUNT(slimTable), NAMED('Input_Recs_Persons'));

OUTPUT(COUNT(dedupTable) - COUNT(slimTable),NAMED('Dup_Persons'));