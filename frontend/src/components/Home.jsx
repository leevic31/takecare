import { Outlet, Link } from "react-router-dom";

export default function Home() {
  return (
    <>      
      <Link to="/organizations">Welcome to Takecare</Link>

      <main>
          <Outlet />
      </main>
    </>
  )
}
