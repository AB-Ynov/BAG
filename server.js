const express = require('express');
const bcrypt = require('bcrypt');
const app = express();
const port = 3000;

// Middleware pour parser le corps des requêtes
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Exemple de stockage des utilisateurs (remplacez cela par une base de données dans un environnement de production)
const users = [];

// Page d'accueil
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

// Page de connexion
app.post('/login', (req, res) => {
    const { username, password } = req.body;

    // Recherche de l'utilisateur dans la liste
    const user = users.find(u => u.username === username);

    // Vérification du mot de passe
    if (user && bcrypt.compareSync(password, user.password)) {
        res.send('Connexion réussie');
    } else {
        res.status(401).send('Nom d\'utilisateur ou mot de passe incorrect');
    }
});

// Page de création de compte
app.post('/register', (req, res) => {
    const { username, password } = req.body;

    // Vérifier si l'utilisateur existe déjà
    if (users.some(u => u.username === username)) {
        res.status(400).send('Nom d\'utilisateur déjà utilisé');
        return;
    }

    // Hachage du mot de passe
    const hashedPassword = bcrypt.hashSync(password, 10);

    // Stockage de l'utilisateur (à remplacer par une base de données)
    users.push({ username, password: hashedPassword });

    res.send('Compte créé avec succès');
});

app.listen(port, () => {
    console.log(`Serveur en cours d'exécution sur http://localhost:${port}`);
});
