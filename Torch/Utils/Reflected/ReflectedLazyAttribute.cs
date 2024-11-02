﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Torch.Utils.Reflected
{
    /// <summary>
    /// Indicates that the type will perform its own call to <see cref="ReflectedManager.Process(Type)"/>
    /// </summary>
    public class ReflectedLazyAttribute : Attribute
    {
    }
}
