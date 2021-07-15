const express = require('express')
const router = express.Router()

const Regsumar = require('../db/regsumar')

router.use(express.json());

// List all courses

router.get("/", express.json(), async (req, res) => {

    const cursos = await Regsumar.GetCursos()

    if (!cursos) return res.sendStatus(404) // internal error
    return res.json(
        cursos.map((curso) => ({
            id: curso.id,
            codigo_curso: curso.cod_curso,
            nome: curso.name,
            duração: curso.duration,
            descriçao: curso.description,
            responsavel:curso.responsavel
        }))
    )
})

//view specific course

router.get('/:id',express.json(),async(req,res)=>{
    const{id}  = req.params;
    const curso = await Regsumar.GetCursos()
    if (!curso) return res.sendStatus(404)
    if (!curso[id-1]) return res.sendStatus(404)
    return res.json(curso[id-1])
    
})

module.exports = router