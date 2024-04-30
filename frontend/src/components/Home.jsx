import { Outlet, Link } from "react-router-dom";

export default function Home() {
  return (
    <>
      <Link to="/organizations" className="text-3xl text-indigo-700 font-bold absolute top-0 left-0">Takecare</Link>

      <main>
          <Outlet />
      </main>
    </>
  )
}
