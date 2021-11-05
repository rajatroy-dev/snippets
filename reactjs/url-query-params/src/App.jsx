import React from "react";
import {
  Link,
  useLocation
} from "react-router-dom";

const useQuery = () => {
  const { search } = useLocation();

  return React.useMemo(() => new URLSearchParams(search), [search]);
}

const Alphabets = (props) => {
  return (
    <>
      {props.alphabet && <p>{`${props.for} for ${props.alphabet}`}</p>}
    </>
  );
}

function App() {
  const query = useQuery();

  return (
    <>
      <div><Link to="/alphabet?for=a&value=apple">A</Link></div>
      <div><Link to="/alphabet?for=b&value=ball">B</Link></div>
      <div><Link to="/alphabet?for=c&value=cat">C</Link></div>
      <div><Link to="/alphabet?for=d&value=dog">D</Link></div>
      <div><Link to="/alphabet?for=e&value=elephant">E</Link></div>

      <Alphabets for={query.get("for")} alphabet={query.get("value")} />
    </>
  );
}

export default App;
