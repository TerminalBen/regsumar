const express = require('express')
const router = express.Router()

const Regsumar = require('../db/regsumar')

router.use(express.json());

// List all disciplinas

router.get("/", express.json(), async (req, res) => {

    const disciplinas = await Regsumar.GetDisciplinas()

    if (!disciplinas) return res.sendStatus(404) // internal error
    return res.json(
        disciplinas.map((disciplina) => ({
            id: disciplina.id,
            Turma_da_diciplina: disciplina.id_turma,
            codigo_docente: disciplina.id_docente,
            nome: disciplina.nome,
            descriçao: disciplina.descrição,
        }))
    )
})

//view specific course

router.get('/:id', express.json(), async (req, res) => {
    const { id } = req.params;
    const disciplina = await Regsumar.GetDisciplinas()
    if (!disciplina) return res.sendStatus(404)
    if (!disciplina[id - 1]) return res.sendStatus(404)
    return res.json(disciplina[id - 1])

})



module.exports = router