# Projet Arbre Généalogique - Trio Cyber

## Vue d'Ensemble

Le projet "Arbre Généalogique" du Trio Cyber simplifie l'accès et l'interaction avec les informations généalogiques. Il combine un système d'authentification sécurisé à une gestion d'arbre généalogique basée sur MariaDB, offrant une expérience fluide et enrichissante. Les utilisateurs peuvent ajouter, modifier et supprimer des membres de la famille tout en explorant des relations complexes.

## Objectifs

L'objectif principal est de créer une application web avec une authentification sécurisée, permettant aux utilisateurs d'accéder à un arbre généalogique interactif. Les caractéristiques notables incluent un système d'authentification sécurisé, une gestion différenciée des comptes utilisateurs, et une interface utilisateur intuitive.

## Caractéristiques

### Système d'Authentification Sécurisé

Chaque utilisateur bénéficiera d'une inscription et d'une connexion sécurisée grâce à notre système d'authentification robuste, préservant ainsi la confidentialité des données.

### Gestion Différenciée des Comptes Utilisateurs

La table "Utilisateur" offre une gestion différenciée des comptes, avec des niveaux d'accès adaptés aux besoins spécifiques, assurant sécurité et confidentialité des informations.

### Interface Utilisateur Intuitive

Basée sur la table "Membre_Famille", notre interface simplifie l'ajout, la modification et la suppression de membres de la famille. Les champs du diagramme entité-relation assurent une manipulation intuitive des données familiales.

### Visualisation Avancée des Relations Familiales

La table "Relation_Famille" permet des fonctionnalités avancées de visualisation des relations familiales, explorant des connexions complexes comme les parents, les enfants, et les frères et sœurs, favorisant une compréhension approfondie de l'arbre généalogique.

## Tâches à Effectuer

### Conception de la Base

Le schéma entité-relation est crucial pour une expérience utilisateur riche. Chaque entité est étudiée pour définir les attributs avec un typage approprié, garantissant la robustesse de la base de données.

#### Code SQL pour la création de la base de données :

```sql
-- create_database.sql
CREATE DATABASE IF NOT EXISTS genealogie;
USE genealogie;
```

#### Schéma Entité-Relation

1. Créez un fichier SQL, "create_tables.sql", pour définir la structure des tables.
2. Utilisez des instructions SQL pour déclarer les tables, les colonnes, les clés primaires et éventuellement les clés étrangères.

```sql
-- create_tables.sql
-- Table pour les utilisateurs
CREATE TABLE IF NOT EXISTS utilisateurs (
    id INT PRIMARY KEY,
    nom_utilisateur VARCHAR(255),
    mot_de_passe VARCHAR(255),
    niveau_acces INT
);

-- Autres tables pour les membres de la famille, les relations familiales, etc.
```

3. Ajoutez ce fichier à votre référentiel GitHub.

### Attributs Pertinents et Typage Approprié

1. Modifiez le fichier "create_tables.sql" pour inclure des attributs pertinents dans vos tables.
2. Assurez-vous que le typage des colonnes est approprié en fonction des données qu'elles contiennent.

```sql
-- create_tables.sql
-- Table pour les utilisateurs
CREATE TABLE IF NOT EXISTS utilisateurs (
    id INT PRIMARY KEY,
    nom_utilisateur VARCHAR(255),
    mot_de_passe VARCHAR(255),
    niveau_acces INT
);

-- Autres tables pour les membres de la famille, les relations familiales, etc.
-- Ajoutez d'autres attributs selon vos besoins.
```

3. Poussez les modifications vers GitHub.

## Fonctionnalités du Système

Au cœur du projet réside le développement d'une interface utilisateur intuitive, accompagné de l'implémentation d'opérations courantes et de la gestion proactive des conflits.

### Description de l'Interface Utilisateur

Notre interface utilisateur incarne l'essence de convivialité et d'accessibilité. Chaque élément est soigneusement conçu pour offrir une expérience intuitive, permettant aux utilisateurs de naviguer aisément dans l'univers complexe des arbres généalogiques. Des designs épurés, des fonctionnalités bien agencées et une navigation fluide définissent notre approche, mettant l'accent sur la clarté visuelle pour rendre la gestion des membres de la famille et l'exploration des relations simples et passionnantes.

### Implémentation des Opérations Courantes

1. **Créer les Fichiers Source**

    - Créez un fichier CSS (`styles.css`) avec le style de votre interface utilisateur.
    
    ```css
    /* styles.css */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f8f8;
    }

    header {
        background-color: #333;
        color: white;
        padding: 1em;
        text-align: center;
    }

    main {
        padding: 1em;
    }

    footer {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 1em;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
    /* Ajoutez d'autres styles en fonction de votre design */
    ```

    - Créez un fichier JavaScript (`script.js`) pour gérer l'interaction côté client.

    ```javascript
    // script.js
    document.addEventListener('DOMContentLoaded', function () {
        // Logique pour afficher l'arbre généalogique et gérer les membres de la famille
        // Ajoutez des événements et des fonctions en fonction de vos besoins
    });
    ```

    - Modifiez le fichier HTML (`index.html`) pour lier le fichier CSS et le fichier JavaScript.

    ```html
    <!-- index.html -->
    <head>
        <!-- ... (rest of the head) ... -->
        <link rel="stylesheet" href="styles.css">
        <script defer src="script.js"></script>
    </head>
    ```

    - Ajoutez et engagez les fichiers dans le référentiel Git.

    ```bash
    git add .
    git commit -m "Ajout de l'interface utilisateur de démonstration"
    git push origin main
    ```

2. **Création de l'Interface Utilisateur**

    Utilisez des bibliothèques telles que React.js pour créer une interface utilisateur réactive. Voici un exemple de composant React pour afficher un arbre généalogique.

    ```jsx
    // Exemple de composant React pour afficher un arbre généalogique
    import React, {

 useState } from 'react';

    const TreeView = ({ familyTree }) => {
        const [selectedPerson, setSelectedPerson] = useState(null);

        const handlePersonClick = (person) => {
            setSelectedPerson(person);
            // Vous pouvez ajouter ici des fonctionnalités supplémentaires liées à la sélection d'une personne
        };

        return (
            <div>
                {familyTree.map((person) => (
                    <div key={person.id} onClick={() => handlePersonClick(person)}>
                        {person.name}
                    </div>
                ))}
                {selectedPerson && (
                    <div>
                        <h2>{selectedPerson.name}</h2>
                        {/* Affichez ici les détails de la personne sélectionnée */}
                    </div>
                )}
            </div>
        );
    };
    ```

## Gestion des Conflits

La gestion proactive des conflits est cruciale pour assurer la robustesse du système. L'implémentation de stratégies de gestion des conflits dans le code et la configuration du système garantit une expérience utilisateur fluide.

## Conclusion

Le projet Arbre Généalogique du Trio Cyber vise à créer une plateforme conviviale et complète pour explorer, gérer et préserver les histoires familiales de manière sécurisée et efficace. Les étapes de conception de la base de données, d'implémentation de l'interface utilisateur et de gestion des conflits contribuent à la réalisation de cet objectif.

## Remerciements

Nous remercions tous ceux qui ont contribué à la réalisation de ce projet et nous sommes impatients de voir l'impact positif de notre solution dans la vie des utilisateurs.

---

**Note:** Les commandes Git suivantes peuvent être utilisées pour ajouter, valider et pousser les changements vers GitHub :

```bash
git add .
git commit -m "Ajout de l'interface utilisateur de démonstration"
git push origin main
```

Vous pouvez suivre [ce lien](https://github.com/AB-Ynov/BAG/edit/main/README.md) pour éditer le fichier README.md directement sur GitHub.
