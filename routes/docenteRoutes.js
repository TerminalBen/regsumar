const express = require('express')
const router = express.Router()

const Regsumar = require('../db/regsumar')

router.use(express.json());

router.get("/", express.json(), async (req, res) => {

	const docentes = await Regsumar.GetDocentes()

	if (!docentes) return res.sendStatus(500) // internal error
	return res.json(
		docentes.map((docente) => ({
			id: docente.idDocente,
			sigla: docente.sigla,
			nome: docente.nome,
			nomeCompleto: docente.nomeCompleto,
			grau: docente.grau,
			departmento: docente.departmento,
		}))
	)
}) 


module.exports = router

