const express = require('express')
const app = express()
const cors=require('cors')
const regsumarRoutes = require('./routes/regsumarRoutes')
const sumarioRoutes = require('./routes/sumarioRoutes')
const docenteRoutes = require('./routes/docenteRoutes')
const disciplinaRoutes = require('./routes/disciplinaRoutes')
const cursoRoutes = require('./routes/cursoRoutes')
const authRoutes = require('./routes/authRoutes')
const iniRegSum = require('./routes/iniRegSum')

app.disable('x-powered-by')
app.use(express.urlencoded({ extended: true }))

// ------------------------ End points -----------------------
// simple route
app.use(cors())
app.use('/', iniRegSum)
//app.use('/regsumar', regsumarRoutes)
app.use('/docentes', docenteRoutes)
app.use('/sumario', sumarioRoutes)
app.use('/disciplina', disciplinaRoutes)
app.use('/curso', cursoRoutes)
//app.use('/auth', authRoutes)

// const PORT = process.env.PORT || 8080;
// app.listen(PORT,console.log('serverStarted on port ${PORT}'));

module.exports = app