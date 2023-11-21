Passo 1: Configurar um projeto React com TypeScript

Se você já possui um projeto React com TypeScript, pode pular para o próximo passo. Caso contrário, siga estas etapas:

Certifique-se de ter o Node.js instalado e execute os seguintes comandos no terminal:

bash
Copy code
npx create-react-app login-app --template typescript
cd login-app
Passo 2: Criar o componente React para a tela de login

Substitua o conteúdo do arquivo src/App.tsx pelo seguinte código:

tsx
Copy code
import React, { useState } from 'react';
import './App.css';

type FormData = {
  email: string;
  password: string;
};

const App: React.FC = () => {
  const [formData, setFormData] = useState<FormData>({
    email: '',
    password: '',
  });
  const [errors, setErrors] = useState<Partial<FormData>>({});

  const handleInputChange = (
    e: React.ChangeEvent<HTMLInputElement>
  ): void => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
    // Limpar o erro do campo quando o usuário começa a digitar novamente
    setErrors({
      ...errors,
      [name]: '',
    });
  };

  const validateForm = (): boolean => {
    const newErrors: Partial<FormData> = {};

    if (!formData.email.includes('@') || !formData.email.includes('.')) {
      newErrors.email = 'Endereço de e-mail inválido';
    }

    if (formData.password.length < 6) {
      newErrors.password = 'A senha deve ter no mínimo 6 caracteres';
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>): void => {
    e.preventDefault();

    if (validateForm()) {
      // Lógica de autenticação ou envio dos dados para o servidor
      console.log('Dados do formulário:', formData);
    } else {
      console.error('Erro: Formulário inválido');
    }
  };

  return (
    <div className="App">
      <h1>Tela de Login</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="email">E-mail:</label>
          <input
            type="email"
            id="email"
            name="email"
            value={formData.email}
            onChange={handleInputChange}
          />
          {errors.email && <span className="error">{errors.email}</span>}
        </div>
        <div>
          <label htmlFor="password">Senha:</label>
          <input
            type="password"
            id="password"
            name="password"
            value={formData.password}
            onChange={handleInputChange}
          />
          {errors.password && <span className="error">{errors.password}</span>}
        </div>
        <button type="submit">Entrar</button>
      </form>
    </div>
  );
};

export default App;
Passo 3: Estilizar o componente

Edite o arquivo src/App.css para adicionar alguns estilos básicos para o formulário de login:

css
Copy code
.App {
  text-align: center;
  margin-top: 50px;
}

form {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 300px;
  margin: auto;
}

div {
  margin-bottom: 10px;
}

label {
  font-weight: bold;
  margin-right: 5px;
}

input {
  padding: 8px;
  margin-left: 5px;
}

button {
  padding: 8px 20px;
  margin-top: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
}

.error {
  color: red;
  font-size: 12px;
}
Passo 4: Executar o aplicativo

No terminal, dentro do diretório do projeto, execute:

bash
Copy code
npm start
Isso iniciará o servidor de desenvolvimento React com TypeScript. Abra o navegador e acesse http://localhost:3000 para ver a tela de login.
