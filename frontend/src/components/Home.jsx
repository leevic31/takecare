import { Outlet, Link } from "react-router-dom";
import { Button, Theme } from '@radix-ui/themes';
import { PersonIcon } from '@radix-ui/react-icons';

export default function Home() {
  return (
    <>
        <Theme appearance="dark" accentColor="violet">
          <Link to="/organizations" className="text-3xl text-indigo-700 font-bold absolute left-0 top-0">Takecare</Link>
          
          <Button>
            <PersonIcon />
            <Link to="/signin">
              Sign in
            </Link>
          </Button>
          
          <Outlet />
        </Theme>
    </>
  )
}
