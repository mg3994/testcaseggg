export function filterObject<T extends Record<string, any>, K extends keyof T>(
  originalObject: T,
  keysToKeep: K[]
): Pick<T, K> {
  const filteredObject = {} as Pick<T, K>;

  for (const key of keysToKeep) {
    if (key in originalObject) {
      filteredObject[key] = originalObject[key];
    }
  }

  return filteredObject;
}
