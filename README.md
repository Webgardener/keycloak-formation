# Lab Keycloak



## Prérequis


- tools: Docker et Go
- un peu de lecture: spec OAuth2 https://datatracker.ietf.org/doc/html/rfc6749

## Concept Oauth2 / OIDC

OAuth2 introduit une idée clé :

> **Une application ne gère plus l’authentification,
> elle délègue cette responsabilité à un tiers.**


Les 4 rôles fondamentaux OAuth2

```text
+-------------------+
| Resource Owner    |  ← l’utilisateur
+-------------------+

+-------------------+
| Client            |  ← notre application
+-------------------+

+-------------------+
| Authorization     |
| Server            |  ← Keycloak
+-------------------+

+-------------------+
| Resource Server   |  ← API protégée
+-------------------+
```


Où se place Keycloak ?

Dans notre contexte (Step-01) :

* Keycloak = **Authorization Server**
* Keycloak = **Identity Provider**
* Notre app = **OAuth Client**
* L’utilisateur = **Resource Owner**

👉 **Un même produit (Keycloak) peut jouer plusieurs rôles**.

---

OAuth2 ≠ Authentification

OAuth2, **à la base**, ne répond qu’à une question :

> *“Est-ce que cette application a le droit d’accéder à cette ressource ?”*

Il ne dit rien sur :

* qui est l’utilisateur
* son email
* son identité

👉 C’est là qu’intervient **OpenID Connect (OIDC)**.

---

OpenID Connect (OIDC)

OIDC est une **surcouche d’OAuth2** qui ajoute :

* un **ID Token**
* une notion d’**identity**
* des claims standard (`sub`, `email`, `name`…)

👉 **OIDC = OAuth2 + identité utilisateur**

---

Diagramme de séquence global

```text
User/Browser        App (Client)           Keycloak (IdP)
    |                     |                       |
    | 1. Login request    |                       |
    |-------------------->|                       |
    |                     | 2. Redirect /auth     |
    |                     |---------------------->|
    |                     |                       |
    |                     | 3. User authenticates |
    |                     |<----------------------|
    |                     |                       |
    |                     | 4. Tokens             |
    |                     |<----------------------|
```


## Step 00 — Bootstrap

Start Keycloak:

```bash
docker compose up
```

Admin UI: http://localhost:8080

user/pass: admin/admin

## Step 01 — (Keycloak = IdP)

* Notre app (le **BFF Go**) est un **client OIDC**
* **Keycloak** joue le rôle d’**Identity Provider** (IdP)
  (et donc aussi d’**Authorization Server** au sens OAuth2/OIDC)


### Démarrage de l'app

```bash
export CGO_ENABLED=0
go run ./cmd/bff

# l'app écoute sur port 3000: http://localhost:3000/health
```

Nous avons une instance Keycloak et une app en Go (qui ne fait pas grand chose pour l'instant)
Dans la step 2, nous allons commencer à relier notre app à Keycloak.


## Step 2 

git checkout step-2



