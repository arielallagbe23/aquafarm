# Aquafarm

## Tâches à effectuer

### 1. Cloner le repository principal
Clonez ce repository et déplacez-vous dans le répertoire correspondant :

```bash
git clone https://github.com/arielallagbe23/aquafarm.git
cd aquafarm
```

---

### 2. Cloner et préparer le backend
Clonez le repository backend dans le répertoire `aquafarm` et renommez-le en `aquafarm-backend` :

```bash
git clone https://github.com/arielallagbe23/aquafarm-backend.git aquafarm-backend
```

Préparez l’environnement Rust pour le backend :

```bash
cd aquafarm-backend
cargo clean && cargo build
```

⚠️ **Ne lancez pas encore `cargo run`.**

Revenez au répertoire principal :

```bash
cd ..
```

---

### 3. Cloner le frontend
Clonez le repository frontend dans le répertoire `aquafarm` :

```bash
git clone https://github.com/arielallagbe23/aquafarm-frontend.git
```

⚠️ **Pas besoin de renommer le dossier, il porte déjà le bon nom (`aquafarm-frontend`).**

---

### 4. Structure attendue du projet
Une fois les repositories clonés, votre architecture de fichiers devrait ressembler à ceci :

```
aquafarm/
├── aquafarm-backend/
│   ├── src/
│   ├── Cargo.toml
│   ├── Cargo.lock
│   ├── Dockerfile
│   └── ...
├── aquafarm-frontend/
│   ├── node_modules/
│   ├── src/
│   ├── public/
│   └── ...
├── docker-compose.yml
└── ...
```

---

### 5. Démarrer les conteneurs avec Docker
Exécutez la commande suivante pour construire et démarrer les conteneurs Docker :

```bash
docker-compose up --build -d
```

Cela lancera les services nécessaires pour :

- La base de données MySQL
- Le frontend React.js
- Le backend Rust

---

### 6. Ajouter les données dans la base de données
Pour insérer les données SQL dans la base de données, suivez ces étapes :

1. Entrez dans le conteneur MySQL :

   ```bash
   docker exec -it aquafarm-db bash
   ```

2. Connectez-vous à MySQL avec l’utilisateur `root` :

   ```bash
   mysql -u root -p
   ```

   Le mot de passe est défini dans le fichier `docker-compose.yml` (par exemple : `aquafarmpassword`).

3. Sélectionnez la base de données `aquafarm-transactions` :

   ```sql
   USE aquafarm-transactions;
   ```

4. Désactivez les vérifications des clés étrangères, insérez les données, puis réactivez-les. Voici les commandes SQL que vous devez exécuter :

   ```sql
   -- Désactiver les vérifications des clés étrangères
   SET FOREIGN_KEY_CHECKS = 0;

   -- Insert data for table `types_user`
   INSERT INTO `types_user` (`id`, `nom_type_user`) VALUES
   (1, 'Administrateur'),
   (2, 'Propriétaire'),
   (3, 'Agent');

   -- Insert data for table `users`
   INSERT INTO `users` (`id`, `type_user_id`, `nom`, `prenom`, `email`, `numero_telephone`, `mot_de_passe`) VALUES
   (2, 2, 'François', 'Truffaut', 'francois.truffaut@example.com', '0612345678', '$2b$12$eImiTXuWVxfM37uY4JANj.QfK2bZfrH1uZNpWvG.KBGa.V9fTtWye');

   -- Insert data for table `domaines`
   INSERT INTO `domaines` (`id`, `user_id`, `nom_domaine`) VALUES
   (1, 2, 'Perleval'),
   (2, 2, 'Perenchie'),
   (3, 2, 'Vernan Giverny');

   -- Insert data for table `types_exploitation`
   INSERT INTO `types_exploitation` (`id`, `nom_type_exploitation`) VALUES
   (1, 'Poulailler'),
   (2, 'Brebis et Porcs'),
   (3, 'Écurie');

   -- Insert data for table `exploitations`
   INSERT INTO `exploitations` (`id`, `type_exploitation_id`, `domaine_id`, `nom_exploitation`) VALUES
   (1, 1, 1, 'Poulailler Perleval'),
   (2, 2, 2, 'Brebis et Porcs Perenchie'),
   (3, 3, 3, 'Écurie Vernan Giverny');

   -- Insert data for table `elements`
   INSERT INTO `elements` (`id`, `exploitation_id`, `nom_element`, `quantite`) VALUES
   (1, 1, 'Poules', 30),
   (2, 2, 'Brebis', 15),
   (3, 2, 'Porcs', 10),
   (4, 3, 'Chevaux', 5);

   -- Réactiver les vérifications des clés étrangères
   SET FOREIGN_KEY_CHECKS = 1;
   ```

5. Quittez MySQL avec :

   ```sql
   EXIT;
   ```

6. Sortez du conteneur MySQL :

   ```bash
   exit
   ```

---

### 7. Accéder aux services
- **Frontend React.js** : [http://localhost:3007/connexion](http://localhost:3007/connexion)
- **MySQL** : Accessible sur le port `3318` depuis votre éditeur de base de données préféré.

- **Variables d’environnement utilisées dans MySQL** :
  - `MYSQL_ROOT_PASSWORD`: `aquafarmpassword`
  - `MYSQL_DATABASE`: `aquafarm-transactions`
 
### 8. Demarrer le backend
```bash
cargo run
```


### 9. Accéder a une session
  - `Email`: `francois.truffaut@example.com`
  - `Mot de passe`: `motdepassefort`
---

Si vous rencontrez des problèmes ou des erreurs, n’hésitez pas à me contacter je vous repondrai le plus tot possible.

