; ================================
; ContextualizeRule
; 
; a)
; R <TV>
;    C ANDLink A
;    C ANDLink B
; |-
; ContextLink <TV>
;    C
;    R A B
;----------------------------------

(define pln-rule-contextualize-and
    (BindLink
        (ListLink
            (VariableNode "$R")
            (VariableNode "$A")
            (VariableNode "$B")
            (VariableNode "$C"))
            (ImplicationLink
                (VariableNode "$R")
                    (AndLink
                        (VariableNode "$C")
                        (VariableNode "$A"))
                    (AndLink
                        (VariableNode "$C")
                        (VariableNode "$B"))
                (ListLink
                    (ContextLink 
                        (VariableNode "$C")
                        (VariableNode "$R"
                            (VariableNode "$A")
                            (VariableNode "$B")))
                    (ExecutionLink
                        (GroundedSchemaNode "scm: pln-formula-context")
                        (ListLink
                            (ContextLink
                                (VariableNode "$C")
                                (VariableNode "$R"
                                    (VariableNode "$A")
                                    (VariableNode "$B")))
                            (VariableNode "$R")))))))


; In an EvaluationLink, the PredicateNode is not 'andified'
(define pln-rule-contextualize-and-evaluation
    (BindLink
        (ListLink
            (TypedVariableLink
                (VariableNode "$R")
                (VariableTypeNode "EvaluationLink"))
            (TypedVariableLink
                (VariableNode "$A")
                (VariableTypeNode "PredicateNode"))
            (VariableNode "$B")
            (VariableNode "$C"))
            (ImplicationLink
                (VariableNode "$R")
                    (VariableNode "$A")
                    (AndLink
                        (VariableNode "$C")
                        (VariableNode "$B"))
                (ListLink
                    (ContextLink
                        (VariableNode "$C")
                        (VariableNode "$R"
                            (VariableNode "$A")
                            (VariableNode "$B")))
                    (ExecutionLink
                        (GroundedSchemaNode "scm: pln-formula-context")
                        (ListLink
                            (ContextLink
                                (VariableNode "$C")
                                (VariableNode "$R"
                                    (VariableNode "$A")
                                    (VariableNode "$B")))
                            (VariableNode "$R")))))))

(define (pln-formula-context Context Relation)
    (cog-set-tv! Context (cog-tv Relation)))


