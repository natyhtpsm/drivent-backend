import { ApplicationError } from '@/protocols';

export function cannotListHotelsError(err :string): ApplicationError {
  return {
    name: `CannotListHotelsError`,
    message: `Cannot list hotels! ${err}`,
  };
}
