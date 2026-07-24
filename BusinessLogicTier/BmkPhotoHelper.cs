using System;

namespace BusinessLogicTier
{
    /// <summary>
    /// Shared photo path helpers for user avatars / uploads.
    /// </summary>
    public static class BmkPhotoHelper
    {
        public static string NormalizePhotoFileName(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
                return string.Empty;

            value = value.Trim().Replace("\\", "/");

            int slash = value.LastIndexOf('/');
            if (slash >= 0 && slash < value.Length - 1)
                value = value.Substring(slash + 1);

            if (value.Equals("default.png", StringComparison.OrdinalIgnoreCase) ||
                value.Equals("default-user.svg", StringComparison.OrdinalIgnoreCase) ||
                value.Equals("null", StringComparison.OrdinalIgnoreCase) ||
                value.Equals("img/default.png", StringComparison.OrdinalIgnoreCase))
            {
                return string.Empty;
            }

            return value;
        }
    }
}
