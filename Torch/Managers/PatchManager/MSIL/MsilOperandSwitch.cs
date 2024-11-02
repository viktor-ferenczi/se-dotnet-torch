﻿using System.IO;
using System.Reflection.Emit;
using Torch.Managers.PatchManager.Transpile;
using Label = System.Reflection.Emit.Label;

namespace Torch.Managers.PatchManager.MSIL
{
    /// <summary>
    ///     Represents the operand for an inline switch statement
    /// </summary>
    public class MsilOperandSwitch : MsilOperand
    {
        internal MsilOperandSwitch(MsilInstruction instruction) : base(instruction)
        {
        }

        /// <summary>
        ///     The target labels for this switch
        /// </summary>
        public MsilLabel[] Labels { get; set; }

        public override int MaxBytes => 4 + (Labels?.Length * 4 ?? 0);

        internal override void CopyTo(MsilOperand operand)
        {
            var lt = operand as MsilOperandSwitch;
            if (lt == null)
                throw new ArgumentException($"Target {operand?.GetType().Name} must be of same type {GetType().Name}", nameof(operand));
            if (Labels == null)
                lt.Labels = null;
            else
            {
                lt.Labels = new MsilLabel[Labels.Length];
                Array.Copy(Labels, lt.Labels, Labels.Length);
            }
        }

        internal override void Read(MethodContext context, BinaryReader reader)
        {
            int length = reader.ReadInt32();
            int offset = (int)reader.BaseStream.Position + 4 * length;
            Labels = new MsilLabel[length];
            for (var i = 0; i < Labels.Length; i++)
                Labels[i] = context.LabelAt(offset + reader.ReadInt32());
        }

        internal override void Emit(LoggingIlGenerator generator)
        {
            generator.Emit(Instruction.OpCode, Labels?.Select(x => x.LabelFor(generator))?.ToArray() ?? Array.Empty<Label>());
        }
    }
}