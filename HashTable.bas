Function HashTableStringNew$
    HASH_TABLE_SIZE = 256
    HTN$ = Chr$(7) + MKL$(HASH_TABLE_SIZE)
    HTNL$ = HashTableLong_ListNew$
    For I~& = 1 To HASH_TABLE_SIZE: ListStringAdd HTNL$, ListStringNew$: Next I~&
    HashTableStringNew$ = HTN$ + HTNL$
End Function
Sub HashTableStringInsert (HASHTABLE$, ITEM$)
    H~% = HashTable_CalculateHash~%(ITEM$)
    H$ = Mid$(HASHTABLE$, 6)
    L$ = ListStringGet$(H$, H~%)
    ListStringAdd L$, ITEM$
    ListStringEdit H$, L$, H~%
    HASHTABLE$ = Left$(HASHTABLE$, 5) + H$
End Sub
Function HashTableSearch~& (HASHTABLE$, ITEM$)
    H~% = HashTable_CalculateHash~%(ITEM$)
    HashTableSearch~& = ListStringSearch~&(ListStringGet$(Mid$(HASHTABLE$, 6), H~%), ITEM$)
End Function
Sub HashTableDelete (HASHTABLE$, ITEM$)
    H~% = HashTable_CalculateHash~%(ITEM$)
    H$ = Mid$(HASHTABLE$, 6)
    L$ = ListStringGet$(H$, H~%)
    S~& = ListStringSearch~&(L$, ITEM$)
    If S~& = 0 Then Exit Sub
    ListStringDelete L$, S~&
    ListStringEdit H$, L$, H~%
    HASHTABLE$ = Left$(HASHTABLE$, 5) + H$
End Sub
Function HashTable_CalculateHash~% (ITEM$)
    T~% = 0
    For I~& = 1 To Len(ITEM$)
        T~% = T~% + Asc(ITEM$, I~&)
    Next I~&
    HashTable_CalculateHash~% = 1 + T~% Mod 256
End Function
Function HashTableLongNew$
    HTN$ = Chr$(9)
    HTNL$ = ListStringNew$
    For I~& = 1 To HASH_TABLE_SIZE: ListStringAdd HTNL$, ListLongNew$: Next I~&
    HashTableLongNew$ = HTN$ + HTNL$
End Function
Sub HashTableLongInsert (HASHTABLE$, ITEM~&)
    H~%% = _SHR(ITEM~&, 24) Xor _SHR(ITEM~&, 16) Xor _SHR(ITEM~&, 8) Xor ITEM~&
    H$ = Mid$(HASHTABLE$, 6)
    L$ = ListStringGet$(H$, H~%%)
    ListLongAdd L$, ITEM~&
    ListStringEdit H$, L$, H~%%
    HASHTABLE$ = Left$(HASHTABLE$, 5) + H$
End Sub
Function HashTableLongSearch~& (HASHTABLE$, ITEM~&)
    H~%% = _SHR(ITEM~&, 24) Xor _SHR(ITEM~&, 16) Xor _SHR(ITEM~&, 8) Xor ITEM~&
    HashTableLongSearch~& = ListStringSearch~&(ListStringGet$(Mid$(HASHTABLE$, 6), H~%%), ITEM$)
End Function
Sub HashTableLongDelete (HASHTABLE$, ITEM~&)
    H~%% = _SHR(ITEM~&, 24) Xor _SHR(ITEM~&, 16) Xor _SHR(ITEM~&, 8) Xor ITEM~&
    H$ = Mid$(HASHTABLE$, 6)
    L$ = ListStringGet$(H$, H~%%)
    S~& = ListLongSearch~&(L$, ITEM~&)
    If S~& = 0 Then Exit Sub
    ListLongDelete L$, S~&
    ListStringEdit H$, L$, H~%%
    HASHTABLE$ = Left$(HASHTABLE$, 5) + H$
End Sub
'$Include:'ListString.bas'
'$Include:'ListLong.bas'
