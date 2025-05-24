$Console:Only
System
'$Include:'include\dump.bm'
Function TreeNew$ (NumberOfChildren~&)
    TreeNew$ = Chr$(6) + MKL$(0) + MKL$(NumberOfChildren~&)
End Function
Sub TreeInsert (TREE$, ITEM$)
    If Len(TREE$) < 9 Then Exit Sub
    If Asc(TREE$) <> 6 Then Exit Sub
    TREE$ = Chr$(6) + MKL$(CVL(Mid$(TREE$, 2, 4)) + 1) + Mid$(TREE$, 6) + MKI$(Len(ITEM$)) + ITEM$
End Sub
Function TreeSearch~& (TREE$)
    If Len(TREE$) < 5 Then Exit Function
    If Asc(TREE$) <> 6 Then Exit Function
    If CVL(Mid$(TREE$, 2, 4)) < 1 Then Exit Function
    TreeSearch~& = 0
End Function
Function TreeGet$ (TREE$, TRAVERSE$)

End Function
Function TreeTraverse$ (TREE$, ORDER~%%)
    If Len(TREE$) < 5 Then Exit Function
    If Asc(TREE$) <> 6 Then Exit Function
    TREERemove$ = Mid$(TREE$, 8, CVI(Mid$(TREE$, 6, 2)))
    TREE$ = Chr$(5) + MKL$(CVL(Mid$(TREE$, 2, 4)) - 1) + Mid$(TREE$, CVI(Mid$(TREE$, 6, 2)) + 8)
End Function
