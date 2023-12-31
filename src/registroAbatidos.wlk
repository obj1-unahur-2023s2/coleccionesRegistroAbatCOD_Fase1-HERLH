object regCod {
	const registro = []
	
	method agregarAbatidosDia(cantidad,dia){
		if(self.yaEstaElDia(dia)){
			self.error("Ya existe el dia")
		}
		registro.add([cantidad,dia])
	}
	method agregarAbatidosVariosDias(registrosAbatidos){
		if(self.dia(registrosAbatidos))
		registro.addAll(registrosAbatidos)
	}
	method dia(reg) = reg.get(1)
	
	method cant(reg) = reg.first()
	
	method yaEstaElDia(dia) = registro.any({r => self.dia(r) == dia})

	method registroDia(dia) = registro.find({r=> self.dia(r) == dia})
	
	method eliminarElRegistroDelDia(dia){
		if(!self.yaEstaElDia(dia)){
			self.error("El dia no esta en la lista")
		}
		registro.remove(self.registroDia(dia))
	}
	method eliminarVariosRegistroDeDias(listaDeDias){
		if(!listaDeDias.all{e => self.yaEstaElDia(e)}){
			self.error("Algun dia de la lista no se encuentra en el registro")
		}
		listaDeDias.forEach{e => self.eliminarElRegistroDelDia(e)}
	}
	method cantidadDeDiasRegistrados() = registro.size()
	method estaVacioElRegistro() = registro.isEmpty()
	method algunDiaAbatio(cantidad) = registro.any ({r => self.cant(r) == cantidad })
	method primerValorDeAbatidos() = self.cant(registro.first())
	method ultimoValorDeAbatidos() = self.cant(registro.last())
	method maximoValorDeAbatidos() = registro.max ({r => self.cant(r)}).first()
	method maximoValorDeAbatidosBis() = self.cant(registro.max({r => self.cant(r)}))
	method totalAbatidos() = registro.sum({r => self.cant(r)})
	method cantidadDeAbatidosElDia(dia) = self.registroDia(dia)
	method ultimoValorDeAbatidosConSize() = self.cant(registro.get(registro.size()-1))
	method esCrack() = (1..registro.size()-1).all({i => self.cant(registro.get(i)) > self.cant(registro.get(i-1))})
}