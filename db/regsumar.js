const DB = require('./db')

class Regsumar {
    static GetDocentes = async () => {
		const sql = `select * from docente`

		const results = await DB.Select(sql)
		return results
	}	

	static GetCursos = async () => {
		const sql = `select * from curso`

		const results =  await DB.Select(sql)
		return results
	}

	static GetDisciplinas = async () => {
		const sql = `select * from disciplina`

		const results = await DB.Select(sql)
		return results
	}

	static GetSumarios = async () => {
		const sql = `select * from sumario`

		const results = await DB.Select(sql)
		return results
	}

	static postSumario = async () => {
		const sql = `insert into sumario(id_disciplina,titulo,nr_aula,descricao) values(${titulo},${nr_aula},${descricao});`

		const results = await DB.Insert(sql)
		return results
	}

	static deleteSumario = async(id) => {
		const sql = 'delete from sumario where id = ${id}'
		const results = await DB.Delete(sql)
		return results
	}

	static editSumario = async (id,titulo,nr_aula,descricao) => {
		const sql = `update  sumario set id = ${id}, titulo = ${titulo}, nr_aula=${nr_aula},descricao = ${descricao} where id = ${id};`

		const results = await DB.Update(sql)
		return results
	}



}

module.exports = Regsumar