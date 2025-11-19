# Projeto Flutter — Sistema de Login, Calendário e Lista de Tarefas

Este projeto Flutter implementa um aplicativo simples com **tela de login**, **calendário** e **lista de tarefas**, ideal para atividades acadêmicas e aprendizado de desenvolvimento mobile.

---

##  Funcionalidades

###  **1. Tela de Login**

* Campo de e-mail e senha
* Botão Entrar e Cadastrar
* Validação simples antes de avançar

---

### 🗓️ **2. Tela de Calendário**

* Usuário seleciona o dia desejado
* Após selecionar, é direcionado para a tela de tarefas daquele dia

---

### 📝 **3. Tela de Tarefas (To-Do List)**

* Adicionar novas tarefas
* Tarefas começam como "não concluídas"
* É possível marcar como concluída
* As tarefas são exibidas em ordem:

  1. **Pendentes primeiro**
  2. **Concluídas depois**
  3. Ambas em ordem alfabética

---

## 🧩 Estrutura dos Arquivos

```
lib/
 ├── main.dart        # Inicialização do app
 ├── login.dart       # Tela de login
 ├── calendar.dart    # Tela de calendário
 └── todo.dart        # Tela de lista de tarefas
```

---

## ▶️ Como Executar

1. Instale o Flutter SDK
2. Abra o projeto no Android Studio ou VS Code
3. Execute o comando:

```
flutter pub get
flutter run
```

Ou clique no botão "Run" do Android Studio.

---

## 🧪 Testado em

* Android Studio Electric Eel ou superior
* Emuladores API 33+ (Pixel 8 / Medium Phone)

---

## 📸 Prints das Telas

As telas devem seguir o layout do modelo enviado, com:

* Tela de boas-vindas
* Tela de login
* Tela de cadastro (opcional)
* Tela de calendário
* Tela de tarefas


---

## 📌 Observações

* O projeto é simples e focado para fins educativos
* Não usa backend real — apenas simulação local
* Pode ser facilmente estendido para usar Firebase

---