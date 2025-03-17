import { NavLink } from "react-router";

const Header = () => {
  return (
    <>
      <NavLink to="/" end>
        Home
      </NavLink>
      <NavLink to="/about" end>
        About
      </NavLink>
      <NavLink to="/contact" end>
        Contact
      </NavLink>
    </>
  );
};

export default Header;
