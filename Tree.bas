$Console:Only
System
Sub Dump (S$)
    For I = 1 To Len(S$)
        Print " "; FILTERCHAR$(Asc(S$, I)); " ";
        T$ = T$ + H2$(Asc(S$, I)) + " "
    Next I
    Print
    Print T$
End Sub
Function FILTERCHAR$ (A~%%)
    Select Case A~%%
        Case 32 To 127: FILTERCHAR$ = Chr$(A~%%)
        Case Else: FILTERCHAR$ = "."
    End Select
End Function
Function H2$ (A~%%)
    H$ = Hex$(A~%%)
    H2$ = String$(2 - Len(H$), 48) + H$
End Function
Function TreeNew$
    TreeNew$ = Chr$(6) + MKL$(0)
End Function
Sub TreeInsert (QUEUE$, ITEM$)
    If Len(QUEUE$) < 5 Then Exit Sub
    If Asc(QUEUE$) <> 6 Then Exit Sub
    QUEUE$ = Chr$(5) + MKL$(CVL(Mid$(QUEUE$, 2, 4)) + 1) + Mid$(QUEUE$, 6) + MKI$(Len(ITEM$)) + ITEM$
End Sub
Function QueuePeek$ (QUEUE$)
    If Len(QUEUE$) < 5 Then Exit Function
    If Asc(QUEUE$) <> 6 Then Exit Function
    If CVL(Mid$(QUEUE$, 2, 4)) < 1 Then Exit Function
    QueuePeek$ = Mid$(QUEUE$, 8, CVI(Mid$(QUEUE$, 6, 2)))
End Function
Function QueueRemove$ (QUEUE$)
    If Len(QUEUE$) < 5 Then Exit Function
    If Asc(QUEUE$) <> 6 Then Exit Function
    QueueRemove$ = Mid$(QUEUE$, 8, CVI(Mid$(QUEUE$, 6, 2)))
    QUEUE$ = Chr$(5) + MKL$(CVL(Mid$(QUEUE$, 2, 4)) - 1) + Mid$(QUEUE$, CVI(Mid$(QUEUE$, 6, 2)) + 8)
End Function
