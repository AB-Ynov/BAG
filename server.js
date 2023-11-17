const express = require('express');
const bcrypt = require('bcrypt');
const db = require('./db'); // Assurez-vous que le chemin est correct

const app = express();
const port = 3000;

// Middleware pour parser le corps des requêtes
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Page d'accueil
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

// Page de connexion
app.post('/login', (req, res) => {
    const { username, password } = req.body;

    // Requête préparée pour récupérer l'utilisateur
    const query = 'SELECT * FROM users WHERE username = ?';
    db.query(query, [username], (error, results) => {
        if (error) {
            console.error('Erreur lors de la requête de connexion :', error);
            res.status(500).send('Erreur de serveur');
            return;
        }

        if (results.length > 0 && bcrypt.compareSync(password, results[0].password)) {
            res.send('Connexion réussie');
        } else {
            res.status(401).send('Nom d\'utilisateur ou mot de passe incorrect');
        }
    });
});

// ... (autres routes)

app.listen(port, () => {
    console.log(`Serveur en cours d'exécution sur http://localhost:${port}`);
});
