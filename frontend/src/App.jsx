import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";

function App() {
  const [randN, setRandN] = useState(0);

  const headersPost = {
    Accept: "application/json",
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
  };

  const getRandN = async () => {
    try {
      const response = await fetch("/api/random_number?", {
        method: "POST",
        headers: headersPost,
        body: JSON.stringify({
          currentN: randN,
        }),
      });
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      const data = await response.json();
      setRandN(data.randN);
    } catch (error) {
      console.error("Failed to get response:", error);
    }
  };

  return (
    <>
      <h1 className="">Dummy App</h1>
      <div className="card flex justify-center">
        <button className="w-full" onClick={() => getRandN()}>
          Random number: {randN}
        </button>
      </div>
    </>
  );
}

export default App;
