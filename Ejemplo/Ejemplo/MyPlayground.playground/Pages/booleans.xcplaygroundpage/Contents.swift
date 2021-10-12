var cedulaProfesional = false
var salario: Int
if cedulaProfesional {
    salario = 9000
} else {
    salario = 8000
}
salario

func sendMessage(name:String, message:String = "Ha ocurrido un error") -> String {
    return "\(name), \(message)";
}

sendMessage(name: "Daniel")
