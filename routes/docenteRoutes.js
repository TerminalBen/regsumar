const express = require('express')
const router = express.Router()

const Regsumar = require('../db/regsumar')

router.use(express.json());

router.get("/", express.json(), async (req, res) => {

	const docentes = await Regsumar.GetDocentes()

	if (!docentes) return res.sendStatus(500) // internal error
	return res.json(
		docentes.map((docente) => ({
			id: docente.id,
			sigla: docente.short_name,
			nome_completo: docente.name,
			degree: docente.degree,
			email: docente.email,
		}))
	)
}) 


module.exports = router

