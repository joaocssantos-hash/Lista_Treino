# 🏋️ Diário de Treinos

Aplicativo desenvolvido em **Flutter** com integração ao **Firebase Authentication** e **Cloud Firestore**, permitindo que usuários criem uma conta, façam login e gerenciem seus treinos de forma simples e prática.

---

## 📱 Funcionalidades

✅ Cadastro de usuários utilizando Firebase Authentication

✅ Login com e-mail e senha

✅ Adição de treinos

✅ Listagem automática dos treinos cadastrados

✅ Exclusão de treinos

✅ Armazenamento em nuvem utilizando Cloud Firestore

---

## 🚀 Tecnologias utilizadas

* Flutter
* Dart
* Firebase Authentication
* Cloud Firestore
* Firebase Core

---

## 📂 Estrutura do projeto

```text
lib/
│
├── models/
│   └── treino.dart
│
├── services/
│   ├── auth_service.dart
│   └── treino_service.dart
│
├── screens/
│   ├── login_screen.dart
│   ├── cadastro_screen.dart
│   └── treino_screen.dart
│
├── firebase_options.dart
└── main.dart
```

### Models

Responsável pela modelagem dos dados da aplicação.

### Services

Responsável pela comunicação com os serviços do Firebase.

### Screens

Responsável pelas telas e interface gráfica do aplicativo.

---

## 🗄️ Banco de dados

O projeto utiliza o **Cloud Firestore**, armazenando os treinos no formato:

```json
{
  "exercicio": "Supino Reto",
  "series": 4,
  "repeticoes": 12
}
```

---

## 🔐 Autenticação

A autenticação foi implementada utilizando **Firebase Authentication**, permitindo:

* Cadastro de usuários
* Login
* Logout
* Controle de acesso às funcionalidades

---

## ▶️ Como executar o projeto

Clone o repositório:

```bash
git clone https://github.com/joaocssantos-hash/Lista_Treino.git
```

Entre na pasta:

```bash
cd Lista_Treino
```

Instale as dependências:

```bash
flutter pub get
```

Execute o projeto:

```bash
flutter run
```

---

## 📸 Telas do aplicativo

* Tela de Login
* Tela de Cadastro
* Tela Principal de Treinos
* Cadastro e remoção de exercícios

---

## 🎓 Objetivo do projeto

Este projeto foi desenvolvido como atividade prática da disciplina de Tecnologias Móveis, com o objetivo de aplicar conceitos de:

* Desenvolvimento mobile com Flutter
* Integração com Firebase
* Autenticação de usuários
* Banco de dados NoSQL
* Organização de projetos em camadas

---

## 👨‍💻 Autor

João Carlos Soares dos Santos

Desenvolvido utilizando Flutter e Firebase.
