import { Outlet, Link } from "react-router-dom";
import { Theme } from '@radix-ui/themes';

export default function Home() {
  return (
    <>
        <Theme appearance="dark" grayColor="sage">
          <Link to="/organizations" className="text-3xl text-indigo-700 font-bold absolute left-0 top-0">Takecare</Link>
          <Outlet />
        </Theme>
    </>
  )
}
