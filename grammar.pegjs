Start
  = exp:(Expression)* "=" {
    return exp.reduce(function(result, element) {
        return exp[0];
      }, 0);
  }
  
Expression
  = head:Term tail:(_ ("+" / "-") _ Term)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "+") { return result + element[3]; }
        if (element[1] === "-") { return result - element[3]; }
      }, head);
    }

Term
  = head:Factor tail:(_ ("*" / "/") _ Factor)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "*") { return result * element[3]; }
        if (element[1] === "/") { return result / element[3]; }
      }, head);
    }

Factor
  = "(" _ expr:Expression _ ")" { return expr; }
  / Float

Float "float"
  = _ [0-9]+ _ ("." [0-9]+)*  { return parseFloat(text(), 10); }

_ "whitespace"
  = [ \t\n\r]*
