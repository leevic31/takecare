import { Outlet, Link } from "react-router-dom";

export default function Home() {
  return (
    <>      
      <Link to="/organizations" className="text-3xl text-purple-700 font-bold underline">Welcome to Takecare</Link>

      <main>
          <Outlet />
      </main>
    </>
  )
}
