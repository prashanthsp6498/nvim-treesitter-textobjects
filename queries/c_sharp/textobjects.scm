(class_declaration
  body: (declaration_list
    .
    "{"
    .
    (_) @_start @_end
    (_)? @_end
    .
    "}"
    (#make-range! "class.inner" @_start @_end))) @class.outer

(class_declaration
  body: (declaration_list
    .
    "{"
    .
    "}")) @class.outer

(struct_declaration
  body: (declaration_list
    .
    "{"
    .
    (_) @_start @_end
    (_)? @_end
    .
    "}"
    (#make-range! "class.inner" @_start @_end))) @class.outer

(struct_declaration
  body: (declaration_list
    .
    "{"
    .
    "}")) @class.outer

(record_declaration
  body: (declaration_list
    .
    "{"
    .
    (_) @_start @_end
    (_)? @_end
    .
    "}"
    (#make-range! "class.inner" @_start @_end))) @class.outer

(record_declaration
  body: (declaration_list
    .
    "{"
    .
    "}")?) @class.outer

(interface_declaration
  body: (declaration_list
    .
    "{"
    .
    (_) @_start @_end
    (_)? @_end
    .
    "}"
    (#make-range! "class.inner" @_start @_end))) @class.outer

(interface_declaration
  body: (declaration_list
    .
    "{"
    .
    "}")) @class.outer

(enum_declaration
  body: (enum_member_declaration_list
    .
    "{"
    .
    (_) @_start @_end
    (_)? @_end
    .
    "}"
    (#make-range! "class.inner" @_start @_end))) @class.outer

(enum_declaration
  body: (enum_member_declaration_list
    .
    "{"
    .
    "}")) @class.outer

(method_declaration
  body: (block
    .
    "{"
    .
    (_) @_start @_end
    (_)? @_end
    .
    "}"
    (#make-range! "function.inner" @_start @_end))) @function.outer

(method_declaration
  body: (arrow_expression_clause
    .
    (_) @_start @_end
    (_)? @_end
    (#make-range! "function.inner" @_start @_end))) @function.outer

(constructor_declaration
  body: (block
    .
    "{"
    .
    (_) @_start @_end
    (_)? @_end
    .
    "}"
    (#make-range! "function.inner" @_start @_end))) @function.outer

(lambda_expression
  body: (block
    .
    "{"
    .
    (_) @_start @_end
    (_)? @_end
    .
    "}"
    (#make-range! "function.inner" @_start @_end))) @function.outer

; loops
(for_statement
  body: (_) @loop.inner) @loop.outer

(foreach_statement
  body: (_) @loop.inner) @loop.outer

(do_statement
  (block) @loop.inner) @loop.outer

(while_statement
  (block) @loop.inner) @loop.outer

; conditionals
(if_statement
  consequence: (_)? @conditional.inner
  alternative: (_)? @conditional.inner) @conditional.outer

(switch_statement
  body: (switch_body) @conditional.inner) @conditional.outer

; calls
(invocation_expression) @call.outer

(invocation_expression
  arguments: (argument_list
    .
    "("
    .
    (_) @_start
    (_)? @_end
    .
    ")"
    (#make-range! "call.inner" @_start @_end)))

; blocks
(_
  (block) @block.inner) @block.outer

; parameters
((parameter_list
  "," @_start
  .
  (parameter) @parameter.inner)
  (#make-range! "parameter.outer" @_start @parameter.inner))

((parameter_list
  .
  (parameter) @parameter.inner
  .
  ","? @_end)
  (#make-range! "parameter.outer" @parameter.inner @_end))

((argument_list
  "," @_start
  .
  (argument) @parameter.inner)
  (#make-range! "parameter.outer" @_start @parameter.inner))

((argument_list
  .
  (argument) @parameter.inner
  .
  ","? @_end)
  (#make-range! "parameter.outer" @parameter.inner @_end))

; comments
(comment) @comment.outer

; assignments
(field_declaration
  (_)
  (variable_declaration
    type: (_)
    (variable_declarator
      name: (_) @assignment.lhs
      (_) @assignment.rhs) @assignment.inner)) @assignment.outer

(field_declaration
  (variable_declaration
    type: (_)
    (variable_declarator
      name: (_) @assignment.lhs
      (_) @assignment.rhs) @assignment.inner)) @assignment.outer

(field_declaration
  (_)
  (variable_declaration
    type: (_)
    (variable_declarator
      name: (_) @assignment.lhs @assignment.inner))) @assignment.outer

(local_declaration_statement
  (_)
  (variable_declaration
    type: (_)
    (variable_declarator
      name: (_) @assignment.lhs
      (_) @assignment.rhs) @assignment.inner)) @assignment.outer

(local_declaration_statement
  (variable_declaration
    type: (_)
    (variable_declarator
      name: (_) @assignment.lhs
      (_) @assignment.rhs) @assignment.inner)) @assignment.outer

(local_declaration_statement
  (_)
  (variable_declaration
    type: (_)
    (variable_declarator
      name: (_) @assignment.lhs @assignment.inner))) @assignment.outer

(expression_statement
  (assignment_expression
    left: (_) @assignment.lhs
    right: (_) @assignment.rhs)) @assignment.inner @assignment.outer

(method_declaration
  name: (_) @assignment.lhs
  body: (arrow_expression_clause
    (_) @assignment.rhs) @assignment.inner) @assignment.outer

(local_function_statement
  type: (_)
  name: (_) @assignment.lhs
  body: (arrow_expression_clause
    (_) @assignment.rhs)) @assignment.inner @assignment.outer
