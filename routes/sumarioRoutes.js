const express = require('express')
const router = express.Router()

const Regsumar = require('../db/regsumar')

router.use(express.json());

router.get('/', express.json(), async (req, res) => {
    const sumarios = await Regsumar.GetSumarios()
    if (!sumarios) return res.sendStatus(404) 
    return res.json(
        sumarios.map((sumario) => ({
            id: sumario.id,
            descricao: sumario.descricao,
            titulo: sumario.titulo,
            id_disciplina: sumario.id_disciplina,
            nr_aula: sumario.nr_aula,
        }))
    )
});

router.post('/new', express.json(), async (req, res) => {
    const { titulo, descricao, nr_aula,id_disciplina } = req.body
    const novo = await Regsumar.postSumario(titulo, descricao, nr_aula, id_disciplina)
    if (!novo) return res.sendStatus(404)
    return res.json("Sucess!")
});

router.put('/edit/:id', express.json(), async (req, res) => {
    const {id} = req.params
    const {titulo, descricao, nr_aula,id_disciplina } = req.body
    const edit = await Regsumar.PutSumario(id,titulo, descricao, nr_aula, id_disciplina)
    if (!edit) return res.sendStatus(404)
    return res.json("Sucess!")
});

router.get('/:id', express.json(), async (req, res) => {
    const { id } = req.params
    const sumario = await Regsumar.GetSumarios()
    if (!sumario) return res.sendStatus(404)
    if (!sumario[id - 1]) return res.sendStatus(404)
    return res.json(sumario[id-1])

})

router.delete('/delete/:id',express.json(),async(req,res)=>{
    const {id} = req.params
    const deletesumario = await Regsumar.deleteSumario(id)
    if (!deletesumario) return res.sendStatus(404)
    return res.json("sucess!")

});

module.exports = router