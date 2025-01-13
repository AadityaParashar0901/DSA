Function ListDoubleNew$
    ListDoubleNew$ = Chr$(4) + MKL$(0)
End Function
Function ListDoublePrint$ (LIST$)
    If Len(LIST$) < 5 Then Exit Function
    If Asc(LIST$) <> 4 Then Exit Function
    O = 6: T_OFFSET = 2
    T$ = String$(Len(LIST$) - 4, 0)
    Asc(T$) = 91 '[
    For I = 1 To CVL(Mid$(LIST$, 2, 4)) - 1
        N$ = _Trim$(Str$(CVD(Mid$(LIST$, 6 + I * 8, 8))))
        L = Len(N$)
        Mid$(T$, T_OFFSET, L + 1) = N$ + ","
        T_OFFSET = T_OFFSET + L + 1
    Next I
    N$ = _Trim$(Str$(CVD(Mid$(LIST$, 6 + I * 8, 8))))
    L = Len(N$)
    Mid$(T$, T_OFFSET, L + 1) = N$ + "]"
    ListDoublePrint$ = Left$(T$, T_OFFSET + L + 1)
End Function
Function ListDoubleLength~& (LIST$)
    If Len(LIST$) < 5 Then Exit Function
    If Asc(LIST$) <> 4 Then Exit Function
    ListDoubleLength~& = CVL(Mid$(LIST$, 2, 4))
End Function
Sub ListDoubleAdd (LIST$, ITEM#)
    If Len(LIST$) < 5 Then Exit Sub
    If Asc(LIST$) <> 4 Then Exit Sub
    LIST$ = Chr$(4) + MKL$(CVL(Mid$(LIST$, 2, 4)) + 1) + Mid$(LIST$, 6) + MKD$(ITEM#)
End Sub
Function ListDoubleGet# (LIST$, POSITION As _Unsigned Long)
    If Len(LIST$) < 5 Then Exit Function
    If Asc(LIST$) <> 4 Then Exit Function
    If CVL(Mid$(LIST$, 2, 4)) < POSITION - 1 Then Exit Function
    ListDoubleGet# = CVD(Mid$(LIST$, 8 * POSITION - 2, 4))
End Function
Sub ListDoubleInsert (LIST$, ITEM#, POSITION As _Unsigned Long)
    If Len(LIST$) < 5 Then Exit Sub
    If Asc(LIST$) <> 4 Then Exit Sub
    If CVL(Mid$(LIST$, 2, 4)) < POSITION - 1 Then Exit Sub
    LIST$ = Chr$(4) + MKL$(CVL(Mid$(LIST$, 2, 4)) + 1) + Mid$(LIST$, 6, POSITION * 8) + MKD$(ITEM#) + Mid$(LIST$, 6 + POSITION * 8)
End Sub
Sub ListDoubleDelete (LIST$, POSITION As _Unsigned Long)
    If Len(LIST$) < 5 Then Exit Sub
    If Asc(LIST$) <> 4 Then Exit Sub
    If CVL(Mid$(LIST$, 2, 4)) < POSITION - 1 Then Exit Sub
    LIST$ = Chr$(4) + MKL$(CVL(Mid$(LIST$, 2, 4)) - 1) + Mid$(LIST$, 6, POSITION * 8) + Mid$(LIST$, 6 + POSITION * 8)
End Sub
Function ListDoubleSearch~& (LIST$, ITEM#)
    If Len(LIST$) < 5 Then Exit Function
    If Asc(LIST$) <> 4 Then Exit Function
    For I = 1 To CVL(Mid$(LIST$, 2, 4))
        If ITEM# = CVD(Mid$(LIST$, 6 + I * 8, 8)) Then ListDoubleSearch~& = I: Exit Function
    Next I
    ListDoubleSearch~& = 0
End Function
Sub ListDoubleEdit (LIST$, ITEM&, POSITION As _Unsigned Long)
    If Len(LIST$) < 5 Then Exit Sub
    If Asc(LIST$) <> 4 Then Exit Sub
    If CVL(Mid$(LIST$, 2, 4)) < POSITION - 1 Then Exit Sub
    LIST$ = Left$(LIST$, 5 + POSITION * 8) + MKL$(ITEM&) + Mid$(LIST$, 6 + POSITION * 8)
End Sub
