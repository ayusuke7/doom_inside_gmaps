const socket = new WebSocket("ws://localhost:8765");

socket.onmessage = (event) => {
  const element = document.getElementById("doom");
  element.src = URL.createObjectURL(event.data);
};

socket.onopen = () => {
  console.log("Conectado ao servidor!");
};

socket.onerror = (error) => {
  console.log("Erro ao conectar ao servidor:", error);
};

socket.onclose = () => {
  console.log("Conexão fechada!");
};
